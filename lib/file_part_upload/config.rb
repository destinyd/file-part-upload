module FilePartUpload
  class Config
    def self.config(&block)
      self.instance_eval &block
    end

    def self.mode(str)
      sym = str.to_sym
      raise "mode 只支持 :qiniu" if ![:qiniu].include?(sym)
      config = FilePartUpload.file_part_upload_config
      config[:mode] = sym
      FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
    end

    def self.qiniu_bucket(qiniu_bucket)
      config = FilePartUpload.file_part_upload_config
      config[:qiniu_bucket] = qiniu_bucket
      FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
    end

    def self.qiniu_domain(qiniu_domain)
      config = FilePartUpload.file_part_upload_config
      config[:qiniu_domain] = qiniu_domain
      FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
    end

    def self.qiniu_base_path(qiniu_base_path)
      config = FilePartUpload.file_part_upload_config
      config[:qiniu_base_path] = qiniu_base_path
      FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
    end

    def self.qiniu_uptoken_url(qiniu_uptoken_url)
      config = FilePartUpload.file_part_upload_config
      config[:qiniu_uptoken_url] = qiniu_uptoken_url
      FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
    end

    def self.qiniu_callback_host(qiniu_callback_host)
      config = FilePartUpload.file_part_upload_config
      config[:qiniu_callback_host] = qiniu_callback_host
      FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
    end

    def self.qiniu_app_access_key(qiniu_app_access_key)
      config = FilePartUpload.file_part_upload_config
      config[:qiniu_app_access_key] = qiniu_app_access_key
      FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
    end

    def self.qiniu_app_secret_key(qiniu_app_secret_key)
      config = FilePartUpload.file_part_upload_config
      config[:qiniu_app_secret_key] = qiniu_app_secret_key
      FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
    end

    def self.qiniu_pfop_pipeline(qiniu_pfop_pipeline)
      config = FilePartUpload.file_part_upload_config
      config[:qiniu_pfop_pipeline] = qiniu_pfop_pipeline
      FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
    end

    def self.qiniu_video_transcode_params(params)
      config = FilePartUpload.file_part_upload_config
      config[:qiniu_video_transcode_params] = params
      FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
    end

    def self.qiniu_audio_and_video_transcode(action)
      if action.to_s == "enable"
        config = FilePartUpload.file_part_upload_config
        config[:qiniu_audio_and_video_transcode] = "enable"
        FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
      end
    end

    def self.image_version(version_name, &block)
      self._qiniu_image_version(version_name, &block)
    end

    def self._qiniu_image_version(version_name, &block)
      config = FilePartUpload.file_part_upload_config
      config[:qiniu_image_versions] ||= {}
      process_type, process_args = self.instance_eval &block
      config[:qiniu_image_versions][version_name.to_s] = {
        :type => process_type.to_s,
        :args => process_args
      }
      FilePartUpload.instance_variable_set(:@file_part_upload_config, config)
    end

    def self.process(process_attr)
      raise "不能同时使用 resize_to_fill resize_to_fit" if !!process_attr[:resize_to_fit] && !!process_attr[:resize_to_fill]
      return :resize_to_fill, process_attr[:resize_to_fill] if !!process_attr[:resize_to_fill]
      return :resize_to_fit, process_attr[:resize_to_fit] if !!process_attr[:resize_to_fit]
    end

    def self.add_methods(_module)
      FilePartUpload::FileEntity.send(:include, _module)
    end
  end
end
