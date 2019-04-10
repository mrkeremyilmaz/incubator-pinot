<<<<<<< HEAD
#!/bin/bash -x
=======
#!/bin/bash
>>>>>>> [Part8]perf changes for kc
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
<<<<<<< HEAD

#
# Merge from the open source Pinot. If the merge failed due to conflict, the Jenkin release will fail, and the user need
# to manually resolved the conflicts and push the change to Uber pinot. After that, the user can run this script again.
git config merge.renameLimit 999999
git remote add upstream git@github.com:linkedin/pinot.git
git fetch --all
# if there is no upstream change, the script will do the maven release.
git merge upstream/master -m "Jenkin release auto merge from the open source Pinot."
# If the merge results in conflicts, abort the release.
if [[ $? -ne 0 ]] ; then
    exit 1
fi
=======
#
>>>>>>> [Part8]perf changes for kc

# ThirdEye related changes
export MAVEN_OPTS="-Xmx8G -Xss128M -XX:MetaspaceSize=512M -XX:MaxMetaspaceSize=1024M -XX:+CMSClassUnloadingEnabled"
release_opts=
if [ -n "$RELEASE_VERSION" ]; then
release_opts="$release_opts -DreleaseVersion=$RELEASE_VERSION"
fi
if [ -n "$NEXT_VERSION" ]; then
release_opts="$release_opts -DdevelopmentVersion=$NEXT_VERSION"
fi
<<<<<<< HEAD
# This step also push the merged change to the Uber pinot
mvn -e -B release:clean release:prepare release:perform -Darguments="-Dgpg.skip=true -Drat.skip=true -Dlicense.skip=true -DskipTests -Dmaven.javadoc.skip=true -P build-shaded-jar" $release_opts
=======
mvn -e -B release:clean release:prepare release:perform -Darguments="-DskipTests -Dmaven.javadoc.skip=true -P build-shaded-jar" $release_opts
>>>>>>> [Part8]perf changes for kc