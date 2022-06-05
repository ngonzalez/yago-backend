require 'csv'
module TaskHelpers
  def clear_nacebel_codes
    NaceBelCode.delete_all
  end
  def import_nacebel_codes
    file = File.open("lib/csv/NACEBEL_2008.csv")
    items = []
    CSV.foreach(file.path, :headers => true, :col_sep => ';', :encoding => 'ISO-8859-1') do |row|
      items << row.to_h
    end
    items.each do |item|
      NaceBelCode.create!(
        code: item[NACEBEL_CSV_HEADERS[:code]],
        level: item[NACEBEL_CSV_HEADERS[:level]],
        parent_code: item[NACEBEL_CSV_HEADERS[:parent_code]],
        label_en: item[NACEBEL_CSV_HEADERS[:label_en]],
        label_de: item[NACEBEL_CSV_HEADERS[:label_de]],
        label_nl: item[NACEBEL_CSV_HEADERS[:label_nl]],
        label_fr: item[NACEBEL_CSV_HEADERS[:label_fr]],
      )
    end
  end
end
