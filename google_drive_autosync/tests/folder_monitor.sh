# This script is used to monitor the folder changes. 


DIR="$HOME/Desktop/*"
echo "PID: $$"
# using inotifywait:
# inotifywait -m -r -e create -e modify -e delete $DIR 

# using entr: 
# change max_user_watches if needed: 
#    sudo sysctl fs.inotify.max_user_instances=8192
#    sudo sysctl fs.inotify.max_user_watches=524288
# TODO:
  # 1. Print the file name that is changed.
  # 2. Print "deleted" when when entry response is "cannot open...""
while true; do
  find $DIR -name ".*" -prune -o -print | entr echo []
done
