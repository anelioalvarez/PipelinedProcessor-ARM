# encoding: utf-8

"""
Print ROM to stdout with Systemverilog syntax
"""

from re import findall
import sys


def main():
    try:
        assembly_code = open("main.list", "r").read()
    except:
        print("Error: file 'main.list' does not exist!")
        sys.exit(1)
    
    pattern = "[0-9a-f]+:\t[0-9a-f]{8}"
    matchs = findall(pattern, assembly_code)

    ROM = map(lambda instr: "32'h" + instr.split("\t")[1], matchs)
    
    print("ROM [0:%s] = '{" %(len(matchs) - 1))
    print(*ROM, sep=",\n")
    print("};")


if __name__ == "__main__":
    main()