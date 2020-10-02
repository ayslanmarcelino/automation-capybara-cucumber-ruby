# frozen_string_literal: true

After do |scenario|
  add_screenshot(scenario)

  if scenario.failed?
    add_browser_logs
  end
end

def add_screenshot(scenario)
  name_scenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
  name_scenario = name_scenario.gsub(' ','_').downcase!
  screenshot = "log/screenshots/#{name_scenario}.png"
  page.save_screenshot(screenshot)
  screenshot = File.read("#{screenshot}")
  attach(screenshot, 'image/png')
end

def add_browser_logs
  time_now = Time.now
  current_url = Capybara.current_url.to_s
  logs = page.driver.browser.manage.logs.get(:browser)
             .map { |line| [line.level, line.message] }
  logs.reject! { |line| %w[WARNING INFO].include?(line.first) }
  embed(time_now.strftime('%d/%m/%Y %H:%M:%S' + "\n") + ('Current URL: ' + current_url + '\n') + logs.join('\n'), 'text/plain', 'BROWSER ERROR')
end

at_exit do
  time_now = Time.now.strftime('%d/%m/%Y %H:%M:%S')
  ReportBuilder.configure do |config|
    config.json_path = 'report.json'
    config.report_path = 'features/reports/cucumber_web_report'
    config.report_types = [:html]
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.report_title = 'Cucumber Report Builder web automation test results'
    config.compress_images = false
    config.additional_info = { 'Project name' => 'Initial Cucumber Capybara',
                               'Platform' => 'Integration',
                               'Report generated' => time_now }
  end
  ReportBuilder.build_report
end
