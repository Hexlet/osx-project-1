#import <Foundation/Foundation.h>

@interface Cell: NSObject
{
	NSMutableArray *_DNA; // maxim 100 objects inside
}
@property(strong, nonatomic) NSMutableArray *DNA;

- (id)init;
- (int)hammingDistance:(Cell *)otherCell;
@end

@interface Cell(mutator)
- (void)mutate:(int)percents;
@end
