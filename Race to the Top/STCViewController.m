//
//  STCViewController.m
//  Race to the Top

#import "STCViewController.h"
#import "STCPathView.h"
#import "STCMountainPath.h"

#define STCMAP_STARTING_SCORE 15000
#define STCMAP_SCORE_DECREMENT_AMOUNT 100
#define STCTIMER_INTERVAL 0.1
#define STCWALL_PENALTY 500

@interface STCViewController ()
@property (strong, nonatomic) IBOutlet STCPathView *pathView;
@property (strong, nonatomic) NSTimer *timer;

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
    self.timer = [NSTimer scheduledTimerWithTimeInterval:STCTIMER_INTERVAL target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", STCMAP_STARTING_SCORE];
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
            [self decrementScoreByAmount:STCWALL_PENALTY];
        }
    }
}

- (void)tapDetected:(UITapGestureRecognizer *)tapRecognizer
{
    NSLog(@"Tapped");
    CGPoint tapLocation = [tapRecognizer locationInView:self.pathView];
    NSLog(@"Tap location is at (%f, %f)", tapLocation.x, tapLocation.y);
}

- (void)timerFired
{
    [self decrementScoreByAmount:STCMAP_SCORE_DECREMENT_AMOUNT];
}

- (void)decrementScoreByAmount:(int)amount
{
    NSString *scoreText = [[self.scoreLabel.text componentsSeparatedByString:@" "] lastObject];
    int score = [scoreText intValue];
    score = score - amount;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", score];
}

@end
