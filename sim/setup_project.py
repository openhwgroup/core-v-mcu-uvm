#! /usr/bin/python3 
########################################################################################################################
## Copyright 2022 Datum Technology Corporation
########################################################################################################################
## SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
## Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
## with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
##                                        https://solderpad.org/licenses/SHL-2.1/
## Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
## an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
## specific language governing permissions and limitations under the License.
########################################################################################################################


########################################################################################################################
# ABOUT
########################################################################################################################
# This script is meant to be run on every new terminal instance.
########################################################################################################################


########################################################################################################################
# DEPENDENCIES
########################################################################################################################
import os
import shutil
import subprocess


########################################################################################################################
# PROJECT SECTION
########################################################################################################################
pwd                = os.getcwd()
project_dir        = pwd + "/.."
temp_path          = project_dir + "/temp"
rtl_path           = project_dir + "/rtl"
rtl_libs_path      = rtl_path + "/.imports"
dv_path            = project_dir + "/dv"
dv_imports_path    = dv_path + "/.imports"
tools_path         = project_dir + "/tools"
tools_imports_path = tools_path + "/.imports"

def main():
    print("Fetching project dependencies ...")
    clone_mio_cli()
    clone_repo_dv_to_imports   ("https://github.com/Datum-Technology-Corporation/uvm.git" , "main", "uvm" )
    clone_repo_dv_to_imports   ("https://github.com/Datum-Technology-Corporation/uvml.git", "main", "uvml")


########################################################################################################################
# UTILITIES
########################################################################################################################
def copy_tree(src, dst, symlinks=False, ignore=None):
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isdir(s):
            shutil.copytree(s, d, symlinks, ignore)
        else:
            shutil.copy2(s, d)

def clone_mio_cli():
    tools_ip_name = "mio"
    dst_path = tools_imports_path + "/" + tools_ip_name
    branch = "main"
    uri = "https://github.com/Datum-Technology-Corporation/mio_cli.git"
    
    if not os.path.exists(tools_imports_path):
        os.mkdir(tools_imports_path)
    if os.path.exists(temp_path):
        shutil.rmtree(temp_path)
    if os.path.exists(dst_path):
        shutil.rmtree(dst_path)
    os.mkdir(dst_path)
    subprocess.call("git clone -q --branch " + branch + " " + uri + " " + temp_path, shell=True)
    copy_tree(temp_path, dst_path)
    shutil.rmtree(temp_path)

def clone_repo_tools_to_imports(uri, branch, tools_ip_name):
    dst_path = tools_imports_path + "/" + tools_ip_name
    
    if not os.path.exists(tools_imports_path):
        os.mkdir(tools_imports_path)
    if os.path.exists(temp_path):
        shutil.rmtree(temp_path)
    if os.path.exists(dst_path):
        shutil.rmtree(dst_path)
    os.mkdir(dst_path)
    subprocess.call("git clone -q --branch " + branch + " " + uri + " " + temp_path, shell=True)
    copy_tree(temp_path + "/tools/" + tools_ip_name, dst_path)
    shutil.rmtree(temp_path)

def clone_repo_dv_to_imports(uri, branch, dv_ip_name):
    dst_path = dv_imports_path + "/" + dv_ip_name
    
    if not os.path.exists(dv_imports_path):
        os.mkdir(dv_imports_path)
    if os.path.exists(temp_path):
        shutil.rmtree(temp_path)
    if os.path.exists(dst_path):
        shutil.rmtree(dst_path)
    os.mkdir(dst_path)
    subprocess.call("git clone -q --branch " + branch + " " + uri + " " + temp_path, shell=True)
    copy_tree(temp_path + "/dv/" + dv_ip_name, dst_path)
    shutil.rmtree(temp_path)


########################################################################################################################
# ENTRY POINT
########################################################################################################################
main()
