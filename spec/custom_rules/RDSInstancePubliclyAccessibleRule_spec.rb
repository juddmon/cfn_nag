require 'spec_helper'
require 'cfn-model'
require 'cfn-nag/custom_rules/RDSInstancePubliclyAccessibleRule'

describe RDSInstancePubliclyAccessibleRule do
  context 'RDS instance with public access' do
    it 'returns offending logical resource id' do
      cfn_model = CfnParser.new.parse read_test_template('json/rds_instance/rds_instance_publicly_accessible.json')

      actual_logical_resource_ids = RDSInstancePubliclyAccessibleRule.new.audit_impl cfn_model
      expected_logical_resource_ids = %w(PublicDB)

      expect(actual_logical_resource_ids).to eq expected_logical_resource_ids
    end
  end
end
