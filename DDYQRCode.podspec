Pod::Spec.new do |ddyspec|
    ddyspec.name         = 'DDYQRCode'
    ddyspec.version      = '1.1.0'
    ddyspec.summary      = '二维码/条形码生成'
    ddyspec.homepage     = 'https://github.com/RainOpen/DDYQRCode'
    ddyspec.license      = 'MIT'
    ddyspec.authors      = {'Rain' => '634778311@qq.com'}
    ddyspec.platform     = :ios, '8.0'
    ddyspec.source       = {:git => 'https://github.com/RainOpen/DDYQRCode.git', :tag => ddyspec.version}
    ddyspec.source_files = 'DDYQRCode/DDYQRCode/*.{h,m}'
    ddyspec.resource     = 'DDYQRCode/DDYQRCode/DDYQRCode.bundle'
    ddyspec.requires_arc = false
end