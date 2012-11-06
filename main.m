
//
// ������ ����������:
// � ����� ��� �������, � ������������ ��� xcode ����� ������ ���� �������,
// ����� �� ������ �� ����� � ���������� ���, ���� �� �������������, ������ :)
//

#import "Cell.h"

@interface Ceil(mutator)
-(void) mutate:(int);
@end

@implementation Ceil(Mutator)
-(void) mutate:(int)x {
    if( x > 100 or x < 0){
        // �� ������ ������ ������ ��� ������������ ��������
        return ;
    }
    // ���������� ���������� ������
    int mutated = 0;
    int i;
    NSArray *nucleotids = [[NSArray alloc] initWithObjects: @"A", @"G", @"T", @"C", nil]
    for( i=0; i < 100; i++ ){
        // �������� ������ �����:
        // �������� � ����� ������������, �� ������ ���� ����������� �������� � �� � �������
        // ������ �� ���� ������� �� �������� � ������� ��� ��������� ������ �����
        if( (x - m) < (arc4random() % (100-i)) ){
            [_DNA replaceObjectAtIndex:i withObject:[nucleotids objectAtIndex:arc4random() % 4]]
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