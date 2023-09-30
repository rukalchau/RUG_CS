import markdown
from datetime import date
now=str(date.today())
log_path="log/"
filename=log_path+"today"+".md"
task_list=["task1","task2"]
task=""
for i in task_list:
    task+="\t-[ ]"+i+"\n"



markdown_string = '''
[TOC]
#%s
# To do
%s
'''%(now,task)
mdfile = markdown.markdown(markdown_string, extensions=['toc'])




with open(filename, 'w+') as f:
    f.write(mdfile)