import pytesseract
import random
from PIL import Image

def pick_random_number(min_val=-1000, max_val=1000):
    """Picks a random number from -1000 to 1000"""
    return (random.randint(min_val, max_val)/2)

def split_number(number):
    """Splits number into single characters, handling negative numbers"""
    string_num = str(number)
    if string_num.startswith('-'):
        return ['negative'] + list(string_num[1:])
    return list(string_num)

def read_result(image_path, x, y, width, height):
    """Read text from a specific region of the image"""
    image = Image.open(image_path)
    # Crop to the region (left, top, right, bottom)
    cropped = image.crop((int(x), int(y), (int(x) + int(width)), (int(y) + int(height))))
    # Save cropped image for debugging
    cropped.save('cropped_display.png')
    text = pytesseract.image_to_string(cropped)
    return text.strip()

def _normalize_number(num_str):
    """Helper method to normalize number string - remove trailing zeros and unnecessary decimal points"""
    try:
        num = float(num_str)
        # Remove trailing zeros and unnecessary decimal point
        if num == int(num):
            return str(int(num))
        return str(num).rstrip('0').rstrip('.')
    except:
        return num_str

def add_inside_python(num1, num2):
    result = num1 + num2
    return _normalize_number(str(result))

def subtract_inside_python(num1, num2):
    result = num1 - num2
    return _normalize_number(str(result))

def multiply_inside_python(num1, num2):
    result = num1 * num2
    return _normalize_number(str(result))

def divide_inside_python(num1, num2):
    result=num1/num2
    return str(round(result, 9))

def square_inside_python(num):
    result = num ** 2
    return _normalize_number(str(result))

def root_inside_python(num):
    result=num**0.5
    return str(round(result, 9))
