MRuby::Gem::Specification.new('mruby-arduino') do |spec|
	spec.license = 'MIT'
 	spec.authors = 'kyab'

	spec.cxx do |cxx|
		cxx.command = "#{ARDUINO_PATH}/tools/avr/bin/avr-gcc"
    cxx.include_paths << [
        "#{MRUBY_ROOT}/include",
        "#{ARDUINO_PATH}/tools/avr/lib/gcc/avr/4.3.2/include",
        "#{ARDUINO_PATH}/tools/avr/avr/include",
        "#{ARDUINO_PATH}/arduino/cores/arduino",
        "#{ARDUINO_PATH}/arduino/variants/mega",
        "#{ARDUINO_PATH}/../libraries"
    ]

    cxx.flags = "-O2 -ffunction-sections -fdata-sections -DARDUINO=103 -mmcu=atmega2560 -DF_CPU=16000000L"
				
		cxx.compile_options = "%{flags} -o %{outfile} -c %{infile}"
	end

end
