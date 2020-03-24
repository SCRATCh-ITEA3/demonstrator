#!/usr/bin/env python3


import os
import subprocess
from git import Repo
from time import sleep


GIT_REPO_PATH = "/home/ubuntu/scratch/demonstrator/"


def isGitPulled():
    repo = Repo(GIT_REPO_PATH)
    if not repo.bare:
        print('Fetching...')
        repo.remotes.origin.fetch()
        commits_behind = repo.iter_commits('master..origin/master')
        b_count = sum(1 for c in commits_behind)
        #print('Commits behind: {}'.format(b_count))
        
        #commits_ahead = repo.iter_commits('origin/master..master')
        #a_count = sum(1 for c in commits_ahead)
        #print('commits ahead: {}'.format(a_count))

        if b_count > 0:
            print('Pulling from git...')
            repo.remotes.origin.pull()
            return 1
    else:
        print("Could not open git repository")
    return 0

def buildCode():
    if not os.path.exists('/home/ubuntu/scratch/demonstrator/cdeploy/bin'):
        os.makedirs('/home/ubuntu/scratch/demonstrator/cdeploy/bin/')

    #run the following command using subprocess
    p = subprocess.run([
                   "gcc",
                   "/home/ubuntu/scratch/demonstrator/src/helloworld.cpp",
                   "-o",
                   "/home/ubuntu/scratch/demonstrator/cdeploy/bin/hello"],
                   stdout=subprocess.PIPE)

    output=p.stdout.decode("utf-8")
    
    if output == '':
        return 1
    else:
        print("Build output: {}".format(output))
    return 0

def executeCode():
    if not os.path.exists('/home/ubuntu/scratch/demonstrator/cdeploy/bin'):
        buildCode()
    #execute the built code using subprocess
    p = subprocess.run(["/home/ubuntu/scratch/demonstrator/cdeploy/bin/hello"], stdout=subprocess.PIPE)
    output = p.stdout
    print('{}'.format(output.decode("utf-8")).strip())


if __name__ == "__main__":

    while(True):
        try:
            print('---------------------------')
            print('NXP SCRATCh Demonstrator')
            print('---------------------------')
            executeCode()
            print('---------------------------')

            for i in range(1,5):
                print('Checking git' + ('.' * i), end='\r')
                sleep(1)
            print()
            if isGitPulled() > 0:
                if buildCode() < 1:
                    print("Errors in build process")
                    break
            else:
                print("Repository is up to date")
            sleep(1)
            subprocess.run(['clear'])
        except KeyboardInterrupt:
            break
        
