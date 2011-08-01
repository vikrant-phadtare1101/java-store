#!/bin/sh

 # Licensed to Ravel, Inc. under one
 # or more contributor license agreements.  See the NOTICE file
 # distributed with this work for additional information
 # regarding copyright ownership.  Ravel, Inc. licenses this file
 # to you under the Apache License, Version 2.0 (the
 # "License"); you may not use this file except in compliance
 # with the License.  You may obtain a copy of the License at
 # 
 #     http://www.apache.org/licenses/LICENSE-2.0
 # 
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License

d "$ORB_HOME"/conf
while read f
do 
echo $f
ip_addr=`echo $f | awk -F ":" '{print $1}'`
ORB=`echo $f | awk -F ":" '{print $2}'`
echo "ORB_HOME=$ORB"
echo "ip_addr=$ip_addr"
ssh -n $ip_addr "$ORB/bin/orb-tracker.sh stop"
echo "Stopped orb-trackers at $f"
done < orbServers
