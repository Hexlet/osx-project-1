#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutator)
-(void) mutate:(float) percent;
-(NSString*) differentObjectsAtIndex:(int) index;
@end

@implementation Cell (Mutator)
-(NSString*) differentObjectsAtIndex:(int) index {
    
    // object - случайный ген
    NSString* object =  [symbols objectAtIndex:arc4random()%[symbols count]];
    // если значения совпали вызываем текущий метод
    if ([[[self dnaArray] objectAtIndex:index] isEqualToString:object]) {
        object =  [self differentObjectsAtIndex:index];
    }
    return object;
}

-(void) mutate:(float) percent {
    
	if ((percent > 100.0f) || (percent < 0.0f))
		return;
    
    int capacity = [[self dnaArray] count];	
    int percentCapacity = capacity*percent/100.0f;
    
    NSMutableArray* unique = [[NSMutableArray alloc] initWithCapacity:percentCapacity];
    
	
	for (int i = 0; i < percentCapacity; i++) {
        
		// index -  случайный индекс
        int index = arc4random()%capacity;
        
        while ([unique containsObject:[NSNumber numberWithInt:index]]) {
            index = arc4random()%capacity;
        }
        
        [unique addObject:[NSNumber numberWithInt: index]];
    }
        
    for (NSNumber* rand in unique) {
        NSString* object = [self differentObjectsAtIndex:[rand intValue]];
        
        [[self dnaArray] replaceObjectAtIndex:[rand intValue] withObject:object];
    }
    
    [unique release];
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	Cell* first = [[[Cell alloc] init] autorelease];
	Cell* second = [[[Cell alloc] init] autorelease];
	
	NSLog(@"befor mutate %d", [first hammingDistance:second]);
	
	[first mutate:50];
	[second mutate:40];
	
	NSLog(@"aftet mutate %d", [first hammingDistance:second]);	

	[pool drain];
    return 0;
}

@end
