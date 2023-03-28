Shader "Custom/WaveToonShader"
{
      Properties
        {
            _MainTex("Main", 2D) = "white" {}
            _OverTex("Over", 2D) = "white" {}
            _scrollX("Scroll X", Range(-5,5)) = 1
            _scrollY("Scroll Y", Range(-5,5)) = 1

            _Color("Color", Color) = (1,1,1,1)
            _RampTex("Ramp Texture", 2D) = "white" {}

        }
            SubShader
            {
                CGPROGRAM
                #pragma surface surf ToonRamp

                 fixed4 _Color;
                sampler2D _RampTex;

                sampler2D _MainTex;
                sampler2D _OverTex;
                float _scrollX;
                float _scrollY;

                struct Input
                {
                    float2 uv_MainTex;
                };

                float4 LightingToonRamp(SurfaceOutput s, fixed3 lightDir, fixed atten)
                {
                    float diff = dot(s.Normal, lightDir);
                    float h = diff * 0.5 + 0.5;
                    float2  rh = h;
                    float3 ramp = tex2D(_RampTex, rh).rgb;

                    float4 c;
                    c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
                    c.a = s.Albedo;
                    return c;
                }

                void surf(Input IN, inout SurfaceOutput o)
                {
                    _scrollX *= _Time;
                    _scrollY *= _Time;
                    float3 main = (tex2D(_MainTex, IN.uv_MainTex + float2(_scrollX, _scrollY)).rgb);
                    float3 over = (tex2D(_OverTex, IN.uv_MainTex + float2(_scrollX / 2.0, _scrollY / 2.0)).rgb);
                    o.Albedo = (main + over) / 2.0;

                    
                }
                ENDCG
            }
                FallBack "Diffuse"
    }
