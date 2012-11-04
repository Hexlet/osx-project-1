//
//  Cell.h
//  DNK
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

//Count of items in DNA array
@property (readonly) int DNACount;

- (int)hammingDistance:(Cell*) cell;

//Method which are used in both Cell and Cell+mutator
-(NSString*) randomDnaType;

@end
