postgresql_database 'bksdb' do
  connection(
      :host      => '127.0.0.1',
      :port      => 5432,
      :username  => 'postgres',
      :password  => node['postgresql']['password']['postgres']
  )
  action :create
end

postgresql_database_user 'bookshare' do
  connection(
      :host      => '127.0.0.1',
      :port      => 5432,
      :username  => 'postgres',
      :password  => node['postgresql']['password']['postgres']
  )
  database_name 'bksdb'
  privileges [:all]
  action :create
end