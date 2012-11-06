
//
// Важное примечание:
// Я писал код вслепую, и отестировать под xcode смогу только дома вечером,
// боюсь не успеть до срока и выкладываю эту, пока не окончательную, версию :)
//

#import "Cell.h"

@interface Cell(mutator)
-(void) mutate:(int)x;
@end

@implementation Cell(Mutator)
-(void) mutate:(int)x {
    if( x > 100 || x < 0){
        // На всякий случай выйдем при некорректном значении
        NSLog(@"Incorrect mutation value");
        return ;
    }
    // Количество замененных клеток
    int mutated = 0;
    NSArray *nucleotids = [[NSArray alloc] initWithObjects: @"A", @"G", @"T", @"C", nil];
    for(int i=0; i < self.DNALength; i++ ){
        // Алгоритм замены такой:
        // заменяем с некой вероятностью, на каждом шаге вероятность меняется и мы её считаем
        // Исходя из того сколько мы заменили и сколько еще осталость пройти шагов
        int rand = arc4random();
        NSLog(@"Chance %i < %i, %i", x*self.DNALength/100, (rand % (self.DNALength-i)), rand);
        bool replace = (x*self.DNALength/100 - mutated) <= (rand % (self.DNALength-i));
        //NSLog(replace?@"Replace":@"Not replace");
        if( replace ){
            // Чуточку усложнения что бы символ был гарантированно другим
            while(true){
                NSString *nucleotid = [nucleotids objectAtIndex:arc4random() % 4];
                if( [self.DNA objectAtIndex:i] != nucleotid ){
                    [self.DNA replaceObjectAtIndex:i withObject:nucleotid];
                    NSLog(@"Mutation %i %@", i, nucleotid);
                    mutated++;
                    break;
                }
            }
        }
    }
}
@end

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cellOne, *cellTwo;
        cellOne = [[Cell alloc] init];
        cellTwo = [[Cell alloc] init];
        
        [cellOne print];
        [cellTwo print];
        NSLog(@"Initial hamming distance: %i", [cellOne hammingDistance:cellTwo]);
        
        [cellOne mutate:50];
        
        [cellOne print];
        [cellTwo print];
        NSLog(@"Hamming distance after mutation: %i", [cellOne hammingDistance:cellTwo]);
    }
    return 0;


}