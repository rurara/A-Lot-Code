//
//  ViewController.m
//  LGestureSample
//
//  Created by lotco on 2017. 5. 18..
//  Copyright © 2017년 r. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gesture:)];
    [self.view addGestureRecognizer:tapGesture];

    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(gesture:)];
    [self.view addGestureRecognizer:pinchGesture];
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(gesture:)];
    [self.view addGestureRecognizer:rotationGesture];
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gesture:)];
    /*
     * swipe하는 방향 등록
     */
    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gesture:)];
    [self.view addGestureRecognizer:panGesture];
    /*
     * swipe와 pan이 비슷한 제스쳐여서 pan을 호출하는동안 swipe가 들어오면 pan을 무시한다
     */
    [panGesture requireGestureRecognizerToFail:swipeGesture];
    
    UIScreenEdgePanGestureRecognizer *screenEdegPanGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(gesture:)];
    [self.view addGestureRecognizer:screenEdegPanGesture];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(gesture:)];
    [self.view addGestureRecognizer:longPressGesture];
}

#pragma mark - gesture
-(void)gesture:(UIGestureRecognizer *)gesture{
    NSLog(@"%@", gesture);
    if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
        mainLabel.text = @"탭";
    } else if ([gesture isKindOfClass:[UIPinchGestureRecognizer class]]) {
        mainLabel.text = @"두손가락 확대/축소";
    } else if ([gesture isKindOfClass:[UIRotationGestureRecognizer class]]) {
        mainLabel.text = @"두손 가락 회전";
    } else if ([gesture isKindOfClass:[UISwipeGestureRecognizer class]]) {
        mainLabel.text = @"빠르게 움직이기";
    } else if ([gesture isKindOfClass:[UIPanGestureRecognizer class]]) {
        mainLabel.text = @"끌기";
    } else if ([gesture isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        mainLabel.text = @"화면 밖에서 끌기";
    } else if ([gesture isKindOfClass:[UILongPressGestureRecognizer class]]) {
        mainLabel.text = @"길게 누르기 ";
    }
}
@end
