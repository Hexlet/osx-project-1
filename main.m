
//
// Важное примечание:
// Я писал код вслепую, и отестировать под xcode смогу только дома вечером,
// боюсь не успеть до срока и выкладываю эту, пока не окончательную, версию :)
//

#import "Cell.h"

@interface Ceil(mutator)
-(void) mutate:(int);
@end

@implementation Ceil(Mutator)
-(void) mutate:(int)x {
    if( x > self.DNALength or x < 0){
        // На всякий случай выйдем при некорректном значении
        return ;
    }
    // Количество замененных клеток
    int mutated = 0;
    NSArray *nucleotids = [[NSArray alloc] initWithObjects: @"A", @"G", @"T", @"C", nil]
    for(int i=0; i < self.DNALength; i++ ){
        // Алгоритм замены такой:
        // заменяем с некой вероятностью, на каждом шаге вероятность меняется и мы её считаем
        // Исходя из того сколько мы заменили и сколько еще осталость пройти шагов
        if( (x - m) < (arc4random() % (self.DNALength-i)) ){
            // Чуточку усложнения что бы символ был гарантированно другим
            while(true){
                NSString *nucleotid = [nucleotids objectAtIndex:arc4random() % 4]
                if( [_DNA objectAtIndex:i] != nucleotid ){
                    [_DNA replaceObjectAtIndex:i withObject:nucleotid];
                    break;
                }
            }
            mutated++;
        }
    }
}
@end

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        Ceil *ceilOne, *ceilTwo;
        ceilOne = [[Ceil alloc] init];
        ceilTwo = [[Ceil alloc] init];
        
        NSLog(@"Initial hamming distance: %i", [ceilOne hammingDistance:ceilTwo])
        
        [ceilOne mutate:40]
        
        NSLog(@"Hamming distance after mutation: %i", [ceilOne hammingDistance:ceilTwo])
    }
    return 0;


}