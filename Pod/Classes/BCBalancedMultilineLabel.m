#import "BCBalancedMultilineLabel.h"

static const CGFloat BCBalancedMultilineLabelIdealWidthSearchThreshold = 16;

@implementation BCBalancedMultilineLabel

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.numberOfLines = 0;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat width = CGRectGetWidth(self.bounds);
    if (self.preferredMaxLayoutWidth != width) {
        self.preferredMaxLayoutWidth = width;
        [self layoutIfNeeded];
    }
}

- (void)drawTextInRect:(CGRect)rect {
    rect = [self idealTextRectForProposedTextRect:rect];
    [super drawTextInRect:rect];
}

#pragma mark - Private

- (CGRect)idealTextRectForProposedTextRect:(CGRect)proposedRect {
    if (self.numberOfLines == 1) {
        return proposedRect;
    }

    CGFloat initialHeight = CGRectGetHeight([self textRectForBounds:proposedRect limitedToNumberOfLines:0]);
    CGFloat singleLineHeight = CGRectGetHeight([self textRectForBounds:proposedRect limitedToNumberOfLines:1]);

    if (initialHeight <= singleLineHeight) {
        return proposedRect;
    }

    CGFloat bestWidth = CGRectGetWidth(proposedRect);
    CGFloat widthUpperBound = bestWidth;
    CGFloat widthLowerBound = floor(bestWidth/2);
    NSInteger iterationCount = 0;

    while (bestWidth > 0) {
        iterationCount++;
        CGFloat attemptedWidth = floor((widthUpperBound+widthLowerBound)/2);
        CGRect attemptedRect = [self textRectForBounds:(CGRect){CGPointZero, {attemptedWidth, CGFLOAT_MAX}} limitedToNumberOfLines:0];

        if (CGRectGetHeight(attemptedRect) <= initialHeight) {
            widthUpperBound = attemptedWidth;
            if (attemptedWidth-widthLowerBound <= BCBalancedMultilineLabelIdealWidthSearchThreshold) {
                bestWidth = attemptedWidth;
                break;
            }
        }
        else {
            widthLowerBound = attemptedWidth;
            if (widthUpperBound-widthLowerBound <= BCBalancedMultilineLabelIdealWidthSearchThreshold) {
                bestWidth = widthUpperBound;
                break;
            }
        }
    }

    return [self alignedTextRectForTextSize:CGSizeMake(bestWidth, initialHeight)];
}

- (CGRect)alignedTextRectForTextSize:(CGSize)size {
    CGFloat originX = 0;

    switch (self.textAlignment) {
        case NSTextAlignmentCenter:
            originX = floor(CGRectGetMidX(self.bounds)-(size.width/2));
            break;
        case NSTextAlignmentRight:
            originX = CGRectGetWidth(self.bounds)-size.width;
            break;
        default:
            break;
    }
    return (CGRect){ {originX, 0}, size };
}

@end
