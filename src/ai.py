import sys

if __name__ == '__main__':
    with open(sys.argv[1], 'w') as ai:
        for f in sys.argv[2:]:
            with open(f, 'r') as src:
                print(f'# {f}\n\n{src.read()}', file=ai)
