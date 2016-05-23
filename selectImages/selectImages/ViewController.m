//
//  HGLimageCVC.h
//  球体图片选择器
//
//  Created by 黑锅 on 16/5/21.
//  Copyright © 2016年 黑锅. All rights reserved.
//
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "HGLSphereView.h"
#import "HGLimageCVC.h"
@interface ViewController ()
@property (nonatomic,strong)NSMutableArray * picsArr;
@property (nonatomic,strong)NSMutableArray * imagesArr;

@property (strong,nonatomic) HGLSphereView * sphereView;
@property (strong,nonatomic) UIButton * btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showImages];
    
}

- (void) showImages{
    self.sphereView = [[HGLSphereView alloc]initWithFrame:CGRectMake(0, 200, kWidth, kWidth)];
    [self.view addSubview:self.sphereView];
    for (int i = 0; i < self.picsArr.count; i++) {
        
        [self.sphereView addSubview:self.picsArr[i]];
    
    }

    
    [self.sphereView setCloudTags:self.picsArr];
    
    _sphereView.backgroundColor = [UIColor clearColor];

}
- (void)showBigImage:(UIButton *)btn {

        self.btn.layer.borderColor = [[UIColor clearColor] CGColor];
    
        self.btn.layer.borderWidth = 0;

        btn.layer.borderColor = [[UIColor redColor] CGColor];
    
        btn.layer.borderWidth = 4;

    
    UICollectionViewFlowLayout * layout =[[UICollectionViewFlowLayout alloc]init];
    HGLimageCVC * cvc  =[[HGLimageCVC alloc]initWithCollectionViewLayout:layout];
    cvc.index = btn.tag;
    cvc.images = self.imagesArr;
    [self.navigationController pushViewController:cvc animated:YES];
 
    self.btn = btn;
    
    
    
    
}

- (UIImage *)getImageByIndex:(NSInteger)index{
    
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"images.bundle"];
    NSString *img_path = [bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"image%zd.jpg",index]];
//    return [UIImage imageNamed:[NSString stringWithFormat:@"images.bundle/image%zd",index]];
    return [UIImage imageWithContentsOfFile:img_path];
   
    
}

-(NSMutableArray *)imagesArr{
    if (!_imagesArr) {
        _imagesArr = [NSMutableArray array];
        for (int i = 0; i < self.picsArr.count; i++) {
            [_imagesArr addObject:[self getImageByIndex:i]];
        }
    }
    return _imagesArr;
    
}

-(NSMutableArray *)picsArr{
    if (!_picsArr) {
        _picsArr = [NSMutableArray arrayWithCapacity:20];
        for (int i = 0; i < 26; i++) {
            
            UIImage * bgImage = [self getImageByIndex:i];
            UIButton * btn  = [[UIButton alloc]init];
            btn.tag = i;
            btn.frame = CGRectMake(0, 0, 30, 50);
            [btn addTarget:self action:@selector(showBigImage:) forControlEvents:UIControlEventTouchUpInside];
            [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
            
            [_picsArr addObject:btn];
        }
    }
    return _picsArr;
}

@end
