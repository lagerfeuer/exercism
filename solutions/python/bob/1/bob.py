def hey(statement):
    st = statement.strip()
    if st.isupper():
        return 'Whoa, chill out!'
    if st[-1:] == '?':
        return 'Sure.'
    if not st:
        return 'Fine. Be that way!'
    return 'Whatever.'