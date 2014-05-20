//
//  STCViewController.m
//  Race to the Top

#import "STCViewController.h"
#import "STCPathView.h"

@interface STCViewController ()
@property (strong, nonatomic) IBOutlet STCPathView *pathView;

@end

@implementation STCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self.pathView addGestureRecognizer:tapRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
    [self.pathView addGestureRecognizer:panRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)panDetected:(UIPanGestureRecognizer *)panRecognizer
{
    CGPoint fingerLocation = [panRecognizer locationInView:self.pathView];
    NSLog(@"I'm at (%f %f)", fingerLocation.x, fingerLocation.y);
}

- (void)tapDetected:(UITapGestureRecognizer *)tapRecognizer
{
    NSLog(@"Tapped");
    CGPoint tapLocation = [tapRecognizer locationInView:self.pathView];
    NSLog(@"Tap location is at (%f, %f)", tapLocation.x, tapLocation.y);
}

@end
