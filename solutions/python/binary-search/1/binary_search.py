def binary_search(list_of_numbers, number):
    if not list_of_numbers:
        raise ValueError("list_of_numbers is empty!")

    begin = 0
    end = len(list_of_numbers) - 1
    middle = (begin + end) // 2

    while begin <= end:
        if list_of_numbers[middle] == number:
            return middle
        if list_of_numbers[middle] < number:
            begin = middle + 1
        else:
            end = middle - 1
        middle = (begin + end) // 2

    raise ValueError("number is not in list_of_numbers!")

