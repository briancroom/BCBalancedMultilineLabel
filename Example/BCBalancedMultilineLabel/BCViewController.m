#import "BCViewController.h"

@interface BCViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *normalLabel;
@property (weak, nonatomic) IBOutlet UILabel *balancedLabel;
@end

@implementation BCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textView becomeFirstResponder];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    self.normalLabel.text = textView.text;
    self.balancedLabel.text = textView.text;
}

#pragma mark - Actions

- (IBAction)backgroundTapped {
    [self.textView resignFirstResponder];
}

@end
