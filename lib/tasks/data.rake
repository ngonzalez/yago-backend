namespace :data do
  require Rails.root.join 'lib/helpers/task_helpers'
  include TaskHelpers

  desc 'Clear NACE-BEL codes'
  task clear_nace_bel_codes: :environment do
    clear_nacebel_codes
  end

  desc 'Import NACE-BEL codes'
  task import_nace_bel_codes: :environment do
    import_nacebel_codes
  end
end
