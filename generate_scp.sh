# This script generate the results on a server and copy them from the server to your local machine

server='server-name'
location_table='/results/all/table.csv'
location_melted_csv='/results/all/combined_csv.csv'
destination='./'
ssh $server << EOSSH
        
	conda activate KasraTorch
	. changedir.sh
	python --version
        python result_generator.py
        python all_csvs.py
EOSSH
scp $server:$location_table $destination
scp $server:$location_melted_csv $destination

