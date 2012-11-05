
#import "CellMutator.h"


@implementation Cell (Mutator)

-(void)mutate: (int) procent{

	if(procent <= 0 || procent >= 100) return;
	
	//создание массива индексов ячеек DNA
	NSMutableArray *mutateIndexes = [[NSMutableArray alloc] initWithCapacity:DNALength];
	
	//массив заполняется int от 0 до 99
	for (int i = 0; i < DNALength; i++)
	{
		[mutateIndexes addObject:[NSNumber numberWithInt:i]];	
	}
	
	//случайная сортировка массива
    for (int i = 0; i < DNALength; i++) {
	    int nElements = DNALength - i;
        int n = (arc4random() % nElements) + i;
        [mutateIndexes exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
	
	//из массива индексов используются первые Х процентов значений
	for (int i = 0; i < procent; i++){
		switch (arc4random()%4) {
			case 0:
				[DNA replaceObjectAtIndex:[[mutateIndexes objectAtIndex:i] intValue] withObject:@"A"];
				break;
			case 1:
				[DNA replaceObjectAtIndex:[[mutateIndexes objectAtIndex:i] intValue] withObject:@"T"];
				break;
			case 2:
				[DNA replaceObjectAtIndex:[[mutateIndexes objectAtIndex:i] intValue] withObject:@"G"];
				break;
			case 3:
				[DNA replaceObjectAtIndex:[[mutateIndexes objectAtIndex:i] intValue] withObject:@"C"];
				break;				
			default:
				break;
		}
	}
}

@end
