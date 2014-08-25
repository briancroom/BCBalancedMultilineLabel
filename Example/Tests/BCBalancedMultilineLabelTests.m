#import <XCTest/XCTest.h>
#import <BCBalancedMultilineLabel/BCBalancedMultilineLabel.h>

static const CGFloat kLabelWidth = 300;

@interface BCBalancedMultilineLabelTests : FBSnapshotTestCase
@property (nonatomic, strong) BCBalancedMultilineLabel *label;
@end

@implementation BCBalancedMultilineLabelTests

- (void)setUp {
    [super setUp];
    self.label = [[BCBalancedMultilineLabel alloc] initWithFrame:CGRectMake(0, 0, kLabelWidth, 50)];
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.text = @"This is a string which wraps onto two lines";
}

- (void)testAdjustsWordWrappingSoLineLengthsAreAsEvenAsPossibleWithLeftAlignment {
    self.label.textAlignment = NSTextAlignmentLeft;
    FBSnapshotVerifyView(self.label, nil);
}

- (void)testAdjustsWordWrappingSoLineLengthsAreAsEvenAsPossibleWithCenterAlignment {
    self.label.textAlignment = NSTextAlignmentCenter;
    FBSnapshotVerifyView(self.label, nil);
}

- (void)testAdjustsWordWrappingSoLineLengthsAreAsEvenAsPossibleWithRightAlignment {
    self.label.textAlignment = NSTextAlignmentRight;
    FBSnapshotVerifyView(self.label, nil);
}

- (void)testSetsUnlimitedNumberOfLinesAsDefault {
    XCTAssertEqual(self.label.numberOfLines, 0, @"Didn't set numberOfLines to 0 upon initialization");
}

- (void)testUpdatesPreferredMaxLayoutWidthToMatchBounds {
    [self.label setNeedsLayout];
    [self.label layoutIfNeeded];
    XCTAssertEqual(self.label.preferredMaxLayoutWidth, kLabelWidth, @"Didn't set preferredMaxLayoutWidth to match bounds width");

    CGFloat newWidth = 100;
    self.label.bounds = CGRectMake(0, 0, newWidth, 20);
    [self.label layoutIfNeeded];
    XCTAssertEqual(self.label.preferredMaxLayoutWidth, newWidth, @"Didn't set preferredMaxLayoutWidth to match bounds width");
}

@end
