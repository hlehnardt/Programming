var = 1
while var == 1:
    i = 0
    sentence = input("What would you like to translate?")
    sentencefix = sentence.lower()
    words = sentencefix.split()
    length = len(words)
    while i < (length):
        print(words[i][1:50]+words[i][0]+"ay")
        i = i + 1
    fin = input("Are you done?")
    if fin == "yes":
        break
print("Goodbye!")
