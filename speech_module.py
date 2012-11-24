map =   {
            0 : '',
            1 : 'one',
            2 : 'two',
            3 : 'three',
            4 : 'four',
            5 : 'five',
            6 : 'six',
            7 : 'seven',
            8 : 'eight',
            9 : 'nine',
            10 : 'ten',
            11 : 'eleven',
            12 : 'twelve',
            13 : 'thirteen',
            14 : 'fourteen',
            15 : 'fifteen',
            16 : 'sixteen',
            17 : 'seventeen',
            18 : 'eighteen',
            19 : 'nineteen',
            20 : 'twenty',
            30 : 'thirty', 
            40 : 'forty',
            50 : 'fifty',
            60 : 'sixty',
            70 : 'seventy',
            80 : 'eighty',
            90 : 'ninety',             
        }
 
def head(number, scale): return int(number) / scale
def tail(number, scale): return number - scale * (int(number) / scale)
def null_tail(number, scale): return (int(number) / scale) * scale
  
def checkio(number):     
    if(map.has_key(number)): return map[number]
    if(number >= 100):
        return "{head} hundred {tail}".format(head=checkio(head(number,100)), tail=checkio(tail(number, 100)))
    if(number > 20):
        return "{head_with_null_tail} {tail}".format(head_with_null_tail=checkio(null_tail(number,10)),tail=checkio(tail(number,10)))
 
if __name__ == '__main__':
    assert checkio(4) == 'four', 'First'    
    assert checkio(133) == 'one hundred thirty three', 'Second'    
    assert checkio(12)=='twelve', 'Third'    
    assert checkio(101)=='one hundred one', 'Fifth'
    assert checkio(212)=='two hundred twelve', 'Sixth'
    assert checkio(40)=='forty', 'Seventh, forty - it is correct'
    