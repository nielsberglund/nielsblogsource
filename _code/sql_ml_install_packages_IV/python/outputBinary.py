import binascii

packageFile = input("Provide full path to the R package file you want to use - Example: 'W:\\randomForest_4.6-14.zip': ")
fileName = input("Provide name of the file you want to create to write the binary to: ")


with open(packageFile, "rb") as binaryfile :
    myArr = binaryfile.read()
    hex_bytes = '0x' + binascii.hexlify(bytearray(myArr)).decode('utf-8')

# print(hex_bytes)

f = open(fileName, "w+")
f.write(hex_bytes)
f.close()