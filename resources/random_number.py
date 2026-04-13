import random

def pick_random_int_number(min_val=0, max_val=1000):
    """Picks a random number from -1000 to 1000"""
    return random.randint(min_val, max_val)

def pick_random_float_number(min_val=-1000, max_val=1000, decimal_nums=2):
    """Picks a random number from -1000 to 1000"""
    number = random.uniform(min_val, max_val)
    return round(number, decimal_nums)

def split_number(number):
    """Splits number into single characters, handling negative numbers"""
    string_num = str(number)
    if string_num.startswith('-'):
        return ['negative'] + list(string_num[1:])
    return list(string_num)