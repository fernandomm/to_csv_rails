module ToCsvRails
  module Export
    def to_csv(options = {})
      return '' unless self.any?

      columns = self.first.attributes.keys.sort.map(&:to_sym)

      if options[:only]
        columns.delete_if{|column| !options[:only].include?(column)}
      end

      if options[:except]
        columns.delete_if{|column| options[:except].include?(column)}
      end

      columns += Array(options[:methods])

      # Keep id column always in first position, if present.
      if columns.index(:id)
        columns.delete(:id)
        columns.unshift(:id)
      end

      output = CSV.generate(Hash.new(options[:csv_options])) do |csv|

        csv << options[:headers] unless options[:headers].nil?

        self.each do |row|
          csv << columns.collect{|column| row.send(column) }
        end
      end

      output
    end
  end
end