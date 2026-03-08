def is_armstrong(number):
    exp = len(str(number))
    num = 0
    for digit in str(number):
        num += int(digit) ** exp
    return num == number