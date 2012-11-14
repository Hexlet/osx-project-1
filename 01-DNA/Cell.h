#import <Foundation/Foundation.h>

@interface Cell : NSObject {
@public
  NSMutableArray* dna_;
}

- (int) hammingDistance:(Cell*)cell;
- (void) generateRandomDna;

@end