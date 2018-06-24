#!/usr/bin/env python
"""
Purpose: export all dashboards from grafana server
Author:  Margin Hu<marginhu@outlook.com>
Version: 1.0
"""

import os,sys
import urllib2
import ConfigParser
import requests
import json

class grafana_portal:
    def __init__(self):
       self.key=""
       self.url=""

def modify_title(title):
    title.replace(" ","_")
    title.replace(":","_")


def config_parse(conf,gp):
    cf = ConfigParser.ConfigParser()
    cf.read(conf)
    gp.url = cf.get("grafana","url")
    gp.key = cf.get("grafana","key") 

def get_dashboard_list(gp):
    url = gp.url+"/api/search/"
    print("url",url)
    req = urllib2.Request(url)
    req.add_header("Authorization","Bearer %s"% gp.key)

    response = urllib2.urlopen(req)
    body = response.read()
    body_list= json.loads(body)
    print(body_list)
    return body_list

def export_dashboard(dash,gp):
    uid = dash['id']
    title=dash['title']
    uri = dash['uri']
    file_path="/tmp/dashboard/" 
    if not os.path.exists(file_path):
        os.makedirs(file_path)

    file_name=file_path+title
    
    url = gp.url+"/api/dashboards/%s"%uri
    print("uid=%d,url is:"%uid, url)

    req = urllib2.Request(url)
    req.add_header("Authorization","Bearer %s"% gp.key)

    response = urllib2.urlopen(req)
    body = response.read()
    print("uid=%d,response is:"%uid, body) 

    with open(file_name,'w') as outfile:
        outfile.write(body)
    outfile.close()


def main():
    if (len(sys.argv) < 2):
        print("Usage: %s grafana.ini"% sys.argv[0])
    
    gp = grafana_portal()
    config_parse(sys.argv[1],gp) 
    
    dlist = get_dashboard_list(gp)  
    for dash in dlist:
        export_dashboard(dash,gp) 




if __name__ == "__main__":
    main()




