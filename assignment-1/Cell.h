#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
    NSArray *DNAItems;
}

@property NSMutableArray *DNA;
@property (readonly) NSArray *DNAItems;

- (int)hammingDistance:(Cell *)dna;

@end