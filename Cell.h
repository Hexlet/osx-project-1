#import <Foundation/Foundation.h>

@interface Cell : NSObject {
	NSArray* nucleobases;
	NSMutableArray* _DNA;
}

@property (readonly) NSMutableArray* DNA;

- (NSUInteger) hammingDistance: (Cell*) target;

@end
