//
//  STCViewController.m
//  Race to the Top

#import "STCViewController.h"
#import "STCPathView.h"
#import "STCMountainPath.h"

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
    // Using the method locationInView to determine where in the coordinate system the touch is occuring.
    CGPoint fingerLocation = [panRecognizer locationInView:self.pathView];
    
    for (UIBezierPath *path in [STCMountainPath mountainPathsForRect:self.pathView.bounds])
    {
        UIBezierPath *tapTarget = [STCMountainPath tapTargetForPath:path];
        
        if ([tapTarget containsPoint:fingerLocation]){
            NSLog(@"You hit the wall");
        }
    }
}

- (void)tapDetected:(UITapGestureRecognizer *)tapRecognizer
{
    NSLog(@"Tapped");
    CGPoint tapLocation = [tapRecognizer locationInView:self.pathView];
    NSLog(@"Tap location is at (%f, %f)", tapLocation.x, tapLocation.y);
}

@end
