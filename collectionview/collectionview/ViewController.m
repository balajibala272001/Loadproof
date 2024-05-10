//
//  ViewController.m
//  collectionview
//
//  Created by SG's Mac on 20/11/23.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegate ,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
@property NSMutableArray *image;
@property NSMutableArray *label;
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _image = [[NSMutableArray alloc]initWithObjects:@"image 1",@"image 2",@"image 3",@"image 4",@"image 5", nil];
    _label= [[NSMutableArray alloc]initWithObjects:@"first",@"second",@"three",@"four",@"five", nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return _image.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell id" forIndexPath:indexPath];
       UIImageView *ImageView=(UIImageView *)[cell viewWithTag:100];
       UILabel *Labelview=(UILabel *)[cell viewWithTag:101];
      
    // Configure the delete button
       UIButton *deleteButton = (UIButton *)[cell viewWithTag:102];
    
    // Sets the image and label based on their corresponding _image and _label
    ImageView.image = [UIImage imageNamed:_image[indexPath.row]];
    Labelview.text = _label[indexPath.row];
       
       return cell;
   }


- (IBAction)deleteButtonTapped:(id)sender forEvent:(UIEvent *)event {

       // Get the index path of the tapped cell
       CGPoint touchLocation = [sender convertPoint:CGPointZero toView:self.collectionview];
       NSIndexPath *indexPath = [self.collectionview indexPathForItemAtPoint:touchLocation];
       
       if (indexPath) {
           // Remove the item from the data source arrays
           [_image removeObjectAtIndex:indexPath.row];
           [_label removeObjectAtIndex:indexPath.row];
           
           // Reload the collection view to reflect the changes
           [self.collectionview deleteItemsAtIndexPaths:@[indexPath]];
       }
   }

   @end
