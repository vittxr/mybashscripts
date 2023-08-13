# This script is used to monitor the folder changes. 

DIR="/home/vitor/Desktop/*" 
echo "PID: $$"

# GETTING TOTAL QUANTITY OF FILES IN A FOLDER:
files_count=$(find $DIR -type f | wc -l)
echo "files in $DIR: $files_count" 

# I have so many files in my Desktop, so when i watch the folder, the ideal is ignore some of them. 
files_count_ignore=$(find $DIR -type d \( -name 'node_modules' -o -name 'venv' -o -name '.git' \) -prune -o -type f -print | wc -l)
echo "Files in $DIR (ignoring some): $files_count_ignore"

# adjusting the max_user_watches (this is a temporary change):
sudo sysctl fs.inotify.max_user_watches=200000

# monitoring the folder:
inotifywait --recursive --monitor --format "%e %w%f" \
--event modify,move,create,delete  --exclude 'node_modules|venv|.git|.expo|.vscode' $DIR |
while read file; do
  echo $file changed
done

