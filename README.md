# coinFlipping

how to use
	
	- (void)viewDidLoad {
	    [super viewDidLoad];
	    DLFilpView *flipView = [[DLFilpView alloc]initWithFirstImageName:@"front" secondImageName:@"tail" timeInterval:0.2 andDirection:DLFlipDirectionX];
	    
	    [self.view addSubview:flipView];
	    flipView.bounds = CGRectMake(0, 0, 200, 200);
	    flipView.center = self.view.center;
	}
	
