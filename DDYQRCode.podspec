Pod::Spec.new do |s|
    s.name         = 'DDYQRCode'
    s.version      = '1.0.0'
    s.summary      = 'An easy way to use pull-to-refresh'
    s.homepage     = 'https://github.com/RainOpen/DDYQRCode'
    s.license      = 'MIT'
    s.authors      = {'Rain' => '634778311@qq.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/RainOpen/DDYQRCode.git', :tag => s.version}
    s.source_files = 'DDYQRCode/**/*.{h,m}'
    s.resource     = 'DDYQRCode/DDYQRCode.bundle'
    s.requires_arc = true
end
