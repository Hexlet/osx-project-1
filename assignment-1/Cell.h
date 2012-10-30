#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
    NSArray *elements;
}

@property NSMutableArray *DNA;
@property (readonly) NSArray *elements;

- (int)hammingDistance:(Cell *)dna;

@end