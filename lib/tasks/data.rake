namespace :data do
  require Rails.root.join 'lib/helpers/task_helpers'
  include TaskHelpers

  desc 'Clear Nacebel codes'
  task clear_nacebel_codes: :environment do
    clear_nacebel_codes
  end

  desc 'Import Nacebel codes'
  task import_nacebel_codes: :environment do
    import_nacebel_codes
  end
end
