#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutator)
-(void) mutate:(int) procent;
@end

@implementation Cell (Mutator)
-(void) mutate:(int) percent {

	if ((percent > 100) || (percent < 0))
		return;

	int capacity = [[self dnaArray] count];
	for (int i = 0; i < capacity*percent/100; i++) {

		// index -  случайный индекс
	        int index = arc4random()%capacity;
		// object - случайный ген
	        NSString* object =  [symbols objectAtIndex:arc4random()%[symbols count]];
	        
		// проверка на совпадение старого и нового значения
	        if (![[[self dnaArray] objectAtIndex:index] isEqualToString:object]) {
		    // замена на новое значение
	            [[self dnaArray] replaceObjectAtIndex:index withObject:object];
	        } else {
		    // если значения совпадают - вызываем текущий метод (рекурсию)
		    // (int)100/capacity - процент для одного цикла
	            [self mutate:(int)100/capacity];
	        }
                             
		
	}
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
