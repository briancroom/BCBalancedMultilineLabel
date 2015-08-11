#import <FBSnapshotTestCase/FBSnapshotTestCase.h>
#import <BCBalancedMultilineLabel/BCBalancedMultilineLabel.h>

@interface BCBalancedMultilineLabelSnapshotTests : FBSnapshotTestCase
@property (nonatomic, strong) BCBalancedMultilineLabel *label;
@end

@implementation BCBalancedMultilineLabelSnapshotTests

- (void)setUp {
    [super setUp];
    self.label = [[BCBalancedMultilineLabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    self.label.font = [UIFont fontWithName:@"HelveticaNeue" size:17.0f];
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.text = @"This is a string which wraps onto two lines";
}

- (void)testAdjustsWordWrappingSoLineLengthsAreAsEvenAsPossibleWithLeftAlignment {
    self.label.textAlignment = NSTextAlignmentLeft;
    FBSnapshotVerifyViewWithOptions(self.label, nil, @[@""], .001);
}

- (void)testAdjustsWordWrappingSoLineLengthsAreAsEvenAsPossibleWithCenterAlignment {
    self.label.textAlignment = NSTextAlignmentCenter;
    FBSnapshotVerifyViewWithOptions(self.label, nil, @[@""], .001);
}

- (void)testAdjustsWordWrappingSoLineLengthsAreAsEvenAsPossibleWithRightAlignment {
    self.label.textAlignment = NSTextAlignmentRight;
    FBSnapshotVerifyViewWithOptions(self.label, nil, @[@""], .001);
}

- (void)testDoesNotModifySingleLineRendering {
    self.label.text = @"One line of text";
    FBSnapshotVerifyViewWithOptions(self.label, nil, @[@""], .001);
}

- (void)testAppropriatelyHandlesExplicitNewlines {
    self.label.text = @"Line One\nHere is a second line that doesn't quite fit.\nLine Three";
    [self.label sizeToFit];
    FBSnapshotVerifyViewWithOptions(self.label, nil, @[@""], .001);
}

@end
