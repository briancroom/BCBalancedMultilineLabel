#import <XCTest/XCTest.h>
#import <BCBalancedMultilineLabel/BCBalancedMultilineLabel.h>

static const CGFloat kLabelWidth = 300;

@interface BCBalancedMultilineLabelTests : XCTestCase
@property (nonatomic, strong) BCBalancedMultilineLabel *label;
@end

@implementation BCBalancedMultilineLabelTests

- (void)setUp {
    [super setUp];
    self.label = [[BCBalancedMultilineLabel alloc] initWithFrame:CGRectMake(0, 0, kLabelWidth, 50)];
    self.label.font = [UIFont fontWithName:@"HelveticaNeue" size:17.0f];
    self.label.text = @"This is a string which wraps onto two lines";
    [self.label layoutIfNeeded];
}

- (void)testSetsUnlimitedNumberOfLinesAsDefault {
    XCTAssertEqual(self.label.numberOfLines, 0, @"Didn't set numberOfLines to 0 upon initialization");
}

- (void)testUpdatesPreferredMaxLayoutWidthToMatchBounds {
    XCTAssertEqual(self.label.preferredMaxLayoutWidth, kLabelWidth, @"Didn't set preferredMaxLayoutWidth to match bounds width");

    CGFloat newWidth = 100;
    self.label.bounds = CGRectMake(0, 0, newWidth, 20);
    [self.label layoutIfNeeded];
    XCTAssertEqual(self.label.preferredMaxLayoutWidth, newWidth, @"Didn't set preferredMaxLayoutWidth to match bounds width");
}

- (void)testCalculatesIntrinsicContentHeightForMultipleLinesAccordingToWidth {
    XCTAssertLessThanOrEqual(self.label.intrinsicContentSize.width, kLabelWidth);
    XCTAssertEqual(self.label.intrinsicContentSize.height, 40);

    CGFloat newWidth = 100;
    self.label.bounds = CGRectMake(0, 0, newWidth, 20);
    [self.label layoutIfNeeded];
    XCTAssertLessThanOrEqual(self.label.intrinsicContentSize.width, newWidth);
    XCTAssertEqual(self.label.intrinsicContentSize.height, 79.5);
}

@end
